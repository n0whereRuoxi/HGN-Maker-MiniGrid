( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b586 - block
    b415 - block
    b307 - block
    b47 - block
    b45 - block
    b327 - block
    b412 - block
    b178 - block
    b242 - block
    b296 - block
    b591 - block
    b374 - block
    b55 - block
    b905 - block
    b500 - block
    b274 - block
    b30 - block
    b668 - block
    b799 - block
    b474 - block
    b818 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b586 )
    ( on b415 b586 )
    ( on b307 b415 )
    ( on b47 b307 )
    ( on b45 b47 )
    ( on b327 b45 )
    ( on b412 b327 )
    ( on b178 b412 )
    ( on b242 b178 )
    ( on b296 b242 )
    ( on b591 b296 )
    ( on b374 b591 )
    ( on b55 b374 )
    ( on b905 b55 )
    ( on b500 b905 )
    ( on b274 b500 )
    ( on b30 b274 )
    ( on b668 b30 )
    ( on b799 b668 )
    ( on b474 b799 )
    ( on b818 b474 )
    ( clear b818 )
  )
  ( :goal
    ( and
      ( clear b586 )
    )
  )
)
