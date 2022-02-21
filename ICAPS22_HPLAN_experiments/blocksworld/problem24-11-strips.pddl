( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b153 - block
    b943 - block
    b515 - block
    b102 - block
    b185 - block
    b587 - block
    b652 - block
    b359 - block
    b375 - block
    b655 - block
    b543 - block
    b603 - block
    b411 - block
    b452 - block
    b858 - block
    b247 - block
    b721 - block
    b251 - block
    b557 - block
    b864 - block
    b260 - block
    b121 - block
    b565 - block
    b639 - block
    b285 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b153 )
    ( on b943 b153 )
    ( on b515 b943 )
    ( on b102 b515 )
    ( on b185 b102 )
    ( on b587 b185 )
    ( on b652 b587 )
    ( on b359 b652 )
    ( on b375 b359 )
    ( on b655 b375 )
    ( on b543 b655 )
    ( on b603 b543 )
    ( on b411 b603 )
    ( on b452 b411 )
    ( on b858 b452 )
    ( on b247 b858 )
    ( on b721 b247 )
    ( on b251 b721 )
    ( on b557 b251 )
    ( on b864 b557 )
    ( on b260 b864 )
    ( on b121 b260 )
    ( on b565 b121 )
    ( on b639 b565 )
    ( on b285 b639 )
    ( clear b285 )
  )
  ( :goal
    ( and
      ( clear b153 )
    )
  )
)
