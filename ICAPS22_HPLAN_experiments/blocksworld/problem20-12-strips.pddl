( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b63 - block
    b981 - block
    b363 - block
    b129 - block
    b29 - block
    b255 - block
    b997 - block
    b909 - block
    b408 - block
    b577 - block
    b515 - block
    b68 - block
    b439 - block
    b879 - block
    b383 - block
    b622 - block
    b150 - block
    b430 - block
    b437 - block
    b161 - block
    b773 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b981 b63 )
    ( on b363 b981 )
    ( on b129 b363 )
    ( on b29 b129 )
    ( on b255 b29 )
    ( on b997 b255 )
    ( on b909 b997 )
    ( on b408 b909 )
    ( on b577 b408 )
    ( on b515 b577 )
    ( on b68 b515 )
    ( on b439 b68 )
    ( on b879 b439 )
    ( on b383 b879 )
    ( on b622 b383 )
    ( on b150 b622 )
    ( on b430 b150 )
    ( on b437 b430 )
    ( on b161 b437 )
    ( on b773 b161 )
    ( clear b773 )
  )
  ( :goal
    ( and
      ( clear b63 )
    )
  )
)
