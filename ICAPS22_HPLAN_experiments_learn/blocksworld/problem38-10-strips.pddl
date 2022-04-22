( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b282 - block
    b881 - block
    b333 - block
    b816 - block
    b614 - block
    b857 - block
    b915 - block
    b215 - block
    b582 - block
    b460 - block
    b1 - block
    b534 - block
    b658 - block
    b338 - block
    b552 - block
    b226 - block
    b830 - block
    b289 - block
    b129 - block
    b157 - block
    b769 - block
    b307 - block
    b501 - block
    b271 - block
    b294 - block
    b177 - block
    b634 - block
    b375 - block
    b591 - block
    b158 - block
    b416 - block
    b229 - block
    b938 - block
    b641 - block
    b454 - block
    b471 - block
    b990 - block
    b297 - block
    b714 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b282 )
    ( on b881 b282 )
    ( on b333 b881 )
    ( on b816 b333 )
    ( on b614 b816 )
    ( on b857 b614 )
    ( on b915 b857 )
    ( on b215 b915 )
    ( on b582 b215 )
    ( on b460 b582 )
    ( on b1 b460 )
    ( on b534 b1 )
    ( on b658 b534 )
    ( on b338 b658 )
    ( on b552 b338 )
    ( on b226 b552 )
    ( on b830 b226 )
    ( on b289 b830 )
    ( on b129 b289 )
    ( on b157 b129 )
    ( on b769 b157 )
    ( on b307 b769 )
    ( on b501 b307 )
    ( on b271 b501 )
    ( on b294 b271 )
    ( on b177 b294 )
    ( on b634 b177 )
    ( on b375 b634 )
    ( on b591 b375 )
    ( on b158 b591 )
    ( on b416 b158 )
    ( on b229 b416 )
    ( on b938 b229 )
    ( on b641 b938 )
    ( on b454 b641 )
    ( on b471 b454 )
    ( on b990 b471 )
    ( on b297 b990 )
    ( on b714 b297 )
    ( clear b714 )
  )
  ( :goal
    ( and
      ( clear b282 )
    )
  )
)
