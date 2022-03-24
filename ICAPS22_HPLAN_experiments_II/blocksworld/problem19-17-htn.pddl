( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b604 - block
    b215 - block
    b534 - block
    b695 - block
    b55 - block
    b683 - block
    b188 - block
    b407 - block
    b470 - block
    b7 - block
    b699 - block
    b610 - block
    b170 - block
    b34 - block
    b955 - block
    b281 - block
    b398 - block
    b41 - block
    b289 - block
    b614 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b604 )
    ( on b215 b604 )
    ( on b534 b215 )
    ( on b695 b534 )
    ( on b55 b695 )
    ( on b683 b55 )
    ( on b188 b683 )
    ( on b407 b188 )
    ( on b470 b407 )
    ( on b7 b470 )
    ( on b699 b7 )
    ( on b610 b699 )
    ( on b170 b610 )
    ( on b34 b170 )
    ( on b955 b34 )
    ( on b281 b955 )
    ( on b398 b281 )
    ( on b41 b398 )
    ( on b289 b41 )
    ( on b614 b289 )
    ( clear b614 )
  )
  ( :tasks
    ( Make-19Pile b215 b534 b695 b55 b683 b188 b407 b470 b7 b699 b610 b170 b34 b955 b281 b398 b41 b289 b614 )
  )
)
