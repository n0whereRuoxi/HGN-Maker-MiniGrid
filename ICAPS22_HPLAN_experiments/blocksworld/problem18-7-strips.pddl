( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b819 - block
    b797 - block
    b65 - block
    b597 - block
    b280 - block
    b561 - block
    b303 - block
    b613 - block
    b758 - block
    b332 - block
    b852 - block
    b963 - block
    b444 - block
    b729 - block
    b541 - block
    b843 - block
    b784 - block
    b522 - block
    b901 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b819 )
    ( on b797 b819 )
    ( on b65 b797 )
    ( on b597 b65 )
    ( on b280 b597 )
    ( on b561 b280 )
    ( on b303 b561 )
    ( on b613 b303 )
    ( on b758 b613 )
    ( on b332 b758 )
    ( on b852 b332 )
    ( on b963 b852 )
    ( on b444 b963 )
    ( on b729 b444 )
    ( on b541 b729 )
    ( on b843 b541 )
    ( on b784 b843 )
    ( on b522 b784 )
    ( on b901 b522 )
    ( clear b901 )
  )
  ( :goal
    ( and
      ( clear b819 )
    )
  )
)
