( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b606 - block
    b804 - block
    b185 - block
    b307 - block
    b477 - block
    b984 - block
    b776 - block
    b791 - block
    b851 - block
    b402 - block
    b20 - block
    b877 - block
    b757 - block
    b7 - block
    b54 - block
    b368 - block
    b716 - block
    b580 - block
    b640 - block
    b967 - block
    b976 - block
    b871 - block
    b766 - block
    b170 - block
    b731 - block
    b365 - block
    b280 - block
    b60 - block
    b943 - block
    b96 - block
    b205 - block
    b364 - block
    b642 - block
    b951 - block
    b519 - block
    b66 - block
    b954 - block
    b5 - block
    b600 - block
    b385 - block
    b930 - block
    b359 - block
    b873 - block
    b315 - block
    b570 - block
    b717 - block
    b212 - block
    b865 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b606 )
    ( on b804 b606 )
    ( on b185 b804 )
    ( on b307 b185 )
    ( on b477 b307 )
    ( on b984 b477 )
    ( on b776 b984 )
    ( on b791 b776 )
    ( on b851 b791 )
    ( on b402 b851 )
    ( on b20 b402 )
    ( on b877 b20 )
    ( on b757 b877 )
    ( on b7 b757 )
    ( on b54 b7 )
    ( on b368 b54 )
    ( on b716 b368 )
    ( on b580 b716 )
    ( on b640 b580 )
    ( on b967 b640 )
    ( on b976 b967 )
    ( on b871 b976 )
    ( on b766 b871 )
    ( on b170 b766 )
    ( on b731 b170 )
    ( on b365 b731 )
    ( on b280 b365 )
    ( on b60 b280 )
    ( on b943 b60 )
    ( on b96 b943 )
    ( on b205 b96 )
    ( on b364 b205 )
    ( on b642 b364 )
    ( on b951 b642 )
    ( on b519 b951 )
    ( on b66 b519 )
    ( on b954 b66 )
    ( on b5 b954 )
    ( on b600 b5 )
    ( on b385 b600 )
    ( on b930 b385 )
    ( on b359 b930 )
    ( on b873 b359 )
    ( on b315 b873 )
    ( on b570 b315 )
    ( on b717 b570 )
    ( on b212 b717 )
    ( on b865 b212 )
    ( clear b865 )
  )
  ( :goal
    ( and
      ( clear b606 )
    )
  )
)
