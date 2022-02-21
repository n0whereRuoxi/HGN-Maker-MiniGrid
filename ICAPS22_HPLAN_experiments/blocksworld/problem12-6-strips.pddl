( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b749 - block
    b947 - block
    b806 - block
    b127 - block
    b933 - block
    b533 - block
    b16 - block
    b228 - block
    b431 - block
    b724 - block
    b276 - block
    b959 - block
    b307 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b749 )
    ( on b947 b749 )
    ( on b806 b947 )
    ( on b127 b806 )
    ( on b933 b127 )
    ( on b533 b933 )
    ( on b16 b533 )
    ( on b228 b16 )
    ( on b431 b228 )
    ( on b724 b431 )
    ( on b276 b724 )
    ( on b959 b276 )
    ( on b307 b959 )
    ( clear b307 )
  )
  ( :goal
    ( and
      ( clear b749 )
    )
  )
)
