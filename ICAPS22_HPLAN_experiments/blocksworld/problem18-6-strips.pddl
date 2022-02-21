( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b418 - block
    b185 - block
    b744 - block
    b412 - block
    b280 - block
    b223 - block
    b713 - block
    b885 - block
    b17 - block
    b41 - block
    b65 - block
    b241 - block
    b503 - block
    b533 - block
    b894 - block
    b888 - block
    b889 - block
    b781 - block
    b635 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b418 )
    ( on b185 b418 )
    ( on b744 b185 )
    ( on b412 b744 )
    ( on b280 b412 )
    ( on b223 b280 )
    ( on b713 b223 )
    ( on b885 b713 )
    ( on b17 b885 )
    ( on b41 b17 )
    ( on b65 b41 )
    ( on b241 b65 )
    ( on b503 b241 )
    ( on b533 b503 )
    ( on b894 b533 )
    ( on b888 b894 )
    ( on b889 b888 )
    ( on b781 b889 )
    ( on b635 b781 )
    ( clear b635 )
  )
  ( :goal
    ( and
      ( clear b418 )
    )
  )
)
