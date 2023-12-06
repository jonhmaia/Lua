(define (lexer code)
  (let ((tokens '())             ; Lista para armazenar os tokens encontrados
        (current-token '())      ; Lista temporária para construir o token atual
        (inside-string? #f))     ; Flag para indicar se estamos dentro de uma string

    ;; Função auxiliar para adicionar um token à lista de tokens
    (define (add-token)
      (when (not (null? current-token))
        (set! tokens (append tokens (list (string->symbol (list->string current-token)))))
        (set! current-token '())))

    ;; Função para processar cada caractere na entrada
    (define (process-char c)
      (cond
       ((char-whitespace? c)     ; Se o caractere for um espaço em branco
        (add-token))             ; Adiciona o token atual à lista de tokens
       ((char=? c #\")            ; Se o caractere for uma aspa dupla
        (if inside-string?       ; Se já estivermos dentro de uma string
            (begin (set! inside-string? #f) (add-token))  ; Marca o final da string e adiciona o token
            (set! inside-string? #t)))  ; Se não estivermos dentro de uma string, marca o início
       (else
        (set! current-token (append current-token (list c))))))  ; Adiciona o caractere atual ao token

    ;; Itera sobre cada caractere na entrada
    (for-each process-char code)
    (add-token)  ; Adiciona o último token à lista de tokens
    tokens))     ; Retorna a lista de tokens resultante

;; Exemplo de uso:
(define code-example
  '(function f < a b >
     vars c
     begin
       a = 2 !
       if a gt b then b = 0 fi
       return 0 !
     end
     function main < >
     begin
       f < 1 2 > !
       delete f @ 2 !
       f < 5 3 > !))

(display (lexer code-example))
