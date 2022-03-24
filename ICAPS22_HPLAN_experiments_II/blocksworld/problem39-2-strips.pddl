( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b396 - block
    b811 - block
    b43 - block
    b852 - block
    b176 - block
    b315 - block
    b70 - block
    b301 - block
    b250 - block
    b795 - block
    b242 - block
    b724 - block
    b326 - block
    b711 - block
    b909 - block
    b953 - block
    b244 - block
    b192 - block
    b879 - block
    b882 - block
    b278 - block
    b280 - block
    b58 - block
    b177 - block
    b347 - block
    b654 - block
    b253 - block
    b214 - block
    b504 - block
    b897 - block
    b201 - block
    b646 - block
    b765 - block
    b143 - block
    b393 - block
    b535 - block
    b236 - block
    b294 - block
    b771 - block
    b754 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b396 )
    ( on b811 b396 )
    ( on b43 b811 )
    ( on b852 b43 )
    ( on b176 b852 )
    ( on b315 b176 )
    ( on b70 b315 )
    ( on b301 b70 )
    ( on b250 b301 )
    ( on b795 b250 )
    ( on b242 b795 )
    ( on b724 b242 )
    ( on b326 b724 )
    ( on b711 b326 )
    ( on b909 b711 )
    ( on b953 b909 )
    ( on b244 b953 )
    ( on b192 b244 )
    ( on b879 b192 )
    ( on b882 b879 )
    ( on b278 b882 )
    ( on b280 b278 )
    ( on b58 b280 )
    ( on b177 b58 )
    ( on b347 b177 )
    ( on b654 b347 )
    ( on b253 b654 )
    ( on b214 b253 )
    ( on b504 b214 )
    ( on b897 b504 )
    ( on b201 b897 )
    ( on b646 b201 )
    ( on b765 b646 )
    ( on b143 b765 )
    ( on b393 b143 )
    ( on b535 b393 )
    ( on b236 b535 )
    ( on b294 b236 )
    ( on b771 b294 )
    ( on b754 b771 )
    ( clear b754 )
  )
  ( :goal
    ( and
      ( clear b396 )
    )
  )
)
