( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b349 - block
    b890 - block
    b551 - block
    b271 - block
    b132 - block
    b965 - block
    b691 - block
    b983 - block
    b307 - block
    b612 - block
    b699 - block
    b127 - block
    b641 - block
    b977 - block
    b365 - block
    b430 - block
    b995 - block
    b347 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b349 )
    ( on b890 b349 )
    ( on b551 b890 )
    ( on b271 b551 )
    ( on b132 b271 )
    ( on b965 b132 )
    ( on b691 b965 )
    ( on b983 b691 )
    ( on b307 b983 )
    ( on b612 b307 )
    ( on b699 b612 )
    ( on b127 b699 )
    ( on b641 b127 )
    ( on b977 b641 )
    ( on b365 b977 )
    ( on b430 b365 )
    ( on b995 b430 )
    ( on b347 b995 )
    ( clear b347 )
  )
  ( :goal
    ( and
      ( clear b349 )
    )
  )
)
