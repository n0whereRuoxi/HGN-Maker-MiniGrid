( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b543 - block
    b715 - block
    b624 - block
    b10 - block
    b872 - block
    b285 - block
    b904 - block
    b449 - block
    b623 - block
    b988 - block
    b180 - block
    b502 - block
    b254 - block
    b626 - block
    b966 - block
    b221 - block
    b304 - block
    b608 - block
    b439 - block
    b112 - block
    b399 - block
    b140 - block
    b301 - block
    b390 - block
    b567 - block
    b84 - block
    b871 - block
    b906 - block
    b943 - block
    b995 - block
    b975 - block
    b800 - block
    b419 - block
    b493 - block
    b734 - block
    b306 - block
    b40 - block
    b662 - block
    b461 - block
    b149 - block
    b433 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b543 )
    ( on b715 b543 )
    ( on b624 b715 )
    ( on b10 b624 )
    ( on b872 b10 )
    ( on b285 b872 )
    ( on b904 b285 )
    ( on b449 b904 )
    ( on b623 b449 )
    ( on b988 b623 )
    ( on b180 b988 )
    ( on b502 b180 )
    ( on b254 b502 )
    ( on b626 b254 )
    ( on b966 b626 )
    ( on b221 b966 )
    ( on b304 b221 )
    ( on b608 b304 )
    ( on b439 b608 )
    ( on b112 b439 )
    ( on b399 b112 )
    ( on b140 b399 )
    ( on b301 b140 )
    ( on b390 b301 )
    ( on b567 b390 )
    ( on b84 b567 )
    ( on b871 b84 )
    ( on b906 b871 )
    ( on b943 b906 )
    ( on b995 b943 )
    ( on b975 b995 )
    ( on b800 b975 )
    ( on b419 b800 )
    ( on b493 b419 )
    ( on b734 b493 )
    ( on b306 b734 )
    ( on b40 b306 )
    ( on b662 b40 )
    ( on b461 b662 )
    ( on b149 b461 )
    ( on b433 b149 )
    ( clear b433 )
  )
  ( :tasks
    ( Make-40Pile b715 b624 b10 b872 b285 b904 b449 b623 b988 b180 b502 b254 b626 b966 b221 b304 b608 b439 b112 b399 b140 b301 b390 b567 b84 b871 b906 b943 b995 b975 b800 b419 b493 b734 b306 b40 b662 b461 b149 b433 )
  )
)
