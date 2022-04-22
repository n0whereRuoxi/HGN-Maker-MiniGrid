( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b485 - block
    b63 - block
    b321 - block
    b756 - block
    b638 - block
    b941 - block
    b20 - block
    b55 - block
    b934 - block
    b750 - block
    b888 - block
    b832 - block
    b883 - block
    b826 - block
    b677 - block
    b253 - block
    b699 - block
    b183 - block
    b657 - block
    b239 - block
    b280 - block
    b950 - block
    b755 - block
    b224 - block
    b903 - block
    b844 - block
    b591 - block
    b923 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b485 )
    ( on b63 b485 )
    ( on b321 b63 )
    ( on b756 b321 )
    ( on b638 b756 )
    ( on b941 b638 )
    ( on b20 b941 )
    ( on b55 b20 )
    ( on b934 b55 )
    ( on b750 b934 )
    ( on b888 b750 )
    ( on b832 b888 )
    ( on b883 b832 )
    ( on b826 b883 )
    ( on b677 b826 )
    ( on b253 b677 )
    ( on b699 b253 )
    ( on b183 b699 )
    ( on b657 b183 )
    ( on b239 b657 )
    ( on b280 b239 )
    ( on b950 b280 )
    ( on b755 b950 )
    ( on b224 b755 )
    ( on b903 b224 )
    ( on b844 b903 )
    ( on b591 b844 )
    ( on b923 b591 )
    ( clear b923 )
  )
  ( :goal
    ( and
      ( clear b485 )
    )
  )
)
