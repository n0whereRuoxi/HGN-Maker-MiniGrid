( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b500 - block
    b104 - block
    b411 - block
    b154 - block
    b889 - block
    b720 - block
    b200 - block
    b49 - block
    b317 - block
    b301 - block
    b822 - block
    b245 - block
    b186 - block
    b161 - block
    b978 - block
    b875 - block
    b304 - block
    b441 - block
    b6 - block
    b607 - block
    b740 - block
    b38 - block
    b289 - block
    b746 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b500 )
    ( on b104 b500 )
    ( on b411 b104 )
    ( on b154 b411 )
    ( on b889 b154 )
    ( on b720 b889 )
    ( on b200 b720 )
    ( on b49 b200 )
    ( on b317 b49 )
    ( on b301 b317 )
    ( on b822 b301 )
    ( on b245 b822 )
    ( on b186 b245 )
    ( on b161 b186 )
    ( on b978 b161 )
    ( on b875 b978 )
    ( on b304 b875 )
    ( on b441 b304 )
    ( on b6 b441 )
    ( on b607 b6 )
    ( on b740 b607 )
    ( on b38 b740 )
    ( on b289 b38 )
    ( on b746 b289 )
    ( clear b746 )
  )
  ( :goal
    ( and
      ( clear b500 )
    )
  )
)
