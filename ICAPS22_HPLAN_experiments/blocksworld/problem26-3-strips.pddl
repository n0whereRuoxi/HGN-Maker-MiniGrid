( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b428 - block
    b661 - block
    b573 - block
    b789 - block
    b309 - block
    b80 - block
    b457 - block
    b854 - block
    b725 - block
    b118 - block
    b333 - block
    b893 - block
    b46 - block
    b721 - block
    b161 - block
    b85 - block
    b612 - block
    b160 - block
    b711 - block
    b37 - block
    b552 - block
    b355 - block
    b290 - block
    b998 - block
    b745 - block
    b44 - block
    b988 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b428 )
    ( on b661 b428 )
    ( on b573 b661 )
    ( on b789 b573 )
    ( on b309 b789 )
    ( on b80 b309 )
    ( on b457 b80 )
    ( on b854 b457 )
    ( on b725 b854 )
    ( on b118 b725 )
    ( on b333 b118 )
    ( on b893 b333 )
    ( on b46 b893 )
    ( on b721 b46 )
    ( on b161 b721 )
    ( on b85 b161 )
    ( on b612 b85 )
    ( on b160 b612 )
    ( on b711 b160 )
    ( on b37 b711 )
    ( on b552 b37 )
    ( on b355 b552 )
    ( on b290 b355 )
    ( on b998 b290 )
    ( on b745 b998 )
    ( on b44 b745 )
    ( on b988 b44 )
    ( clear b988 )
  )
  ( :goal
    ( and
      ( clear b428 )
    )
  )
)
