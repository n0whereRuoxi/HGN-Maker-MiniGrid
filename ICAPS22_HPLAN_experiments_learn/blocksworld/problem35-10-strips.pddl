( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b831 - block
    b878 - block
    b105 - block
    b954 - block
    b595 - block
    b403 - block
    b932 - block
    b650 - block
    b311 - block
    b479 - block
    b862 - block
    b260 - block
    b991 - block
    b369 - block
    b104 - block
    b138 - block
    b958 - block
    b997 - block
    b938 - block
    b939 - block
    b364 - block
    b850 - block
    b602 - block
    b576 - block
    b350 - block
    b806 - block
    b347 - block
    b711 - block
    b46 - block
    b424 - block
    b729 - block
    b666 - block
    b422 - block
    b290 - block
    b79 - block
    b55 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b831 )
    ( on b878 b831 )
    ( on b105 b878 )
    ( on b954 b105 )
    ( on b595 b954 )
    ( on b403 b595 )
    ( on b932 b403 )
    ( on b650 b932 )
    ( on b311 b650 )
    ( on b479 b311 )
    ( on b862 b479 )
    ( on b260 b862 )
    ( on b991 b260 )
    ( on b369 b991 )
    ( on b104 b369 )
    ( on b138 b104 )
    ( on b958 b138 )
    ( on b997 b958 )
    ( on b938 b997 )
    ( on b939 b938 )
    ( on b364 b939 )
    ( on b850 b364 )
    ( on b602 b850 )
    ( on b576 b602 )
    ( on b350 b576 )
    ( on b806 b350 )
    ( on b347 b806 )
    ( on b711 b347 )
    ( on b46 b711 )
    ( on b424 b46 )
    ( on b729 b424 )
    ( on b666 b729 )
    ( on b422 b666 )
    ( on b290 b422 )
    ( on b79 b290 )
    ( on b55 b79 )
    ( clear b55 )
  )
  ( :goal
    ( and
      ( clear b831 )
    )
  )
)
