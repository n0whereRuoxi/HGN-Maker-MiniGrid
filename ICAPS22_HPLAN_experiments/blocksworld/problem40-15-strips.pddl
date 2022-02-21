( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b240 - block
    b721 - block
    b157 - block
    b555 - block
    b572 - block
    b423 - block
    b47 - block
    b446 - block
    b275 - block
    b814 - block
    b436 - block
    b285 - block
    b968 - block
    b564 - block
    b733 - block
    b717 - block
    b950 - block
    b907 - block
    b466 - block
    b559 - block
    b929 - block
    b308 - block
    b924 - block
    b444 - block
    b872 - block
    b383 - block
    b920 - block
    b873 - block
    b402 - block
    b871 - block
    b816 - block
    b831 - block
    b89 - block
    b396 - block
    b556 - block
    b39 - block
    b543 - block
    b732 - block
    b902 - block
    b638 - block
    b313 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b240 )
    ( on b721 b240 )
    ( on b157 b721 )
    ( on b555 b157 )
    ( on b572 b555 )
    ( on b423 b572 )
    ( on b47 b423 )
    ( on b446 b47 )
    ( on b275 b446 )
    ( on b814 b275 )
    ( on b436 b814 )
    ( on b285 b436 )
    ( on b968 b285 )
    ( on b564 b968 )
    ( on b733 b564 )
    ( on b717 b733 )
    ( on b950 b717 )
    ( on b907 b950 )
    ( on b466 b907 )
    ( on b559 b466 )
    ( on b929 b559 )
    ( on b308 b929 )
    ( on b924 b308 )
    ( on b444 b924 )
    ( on b872 b444 )
    ( on b383 b872 )
    ( on b920 b383 )
    ( on b873 b920 )
    ( on b402 b873 )
    ( on b871 b402 )
    ( on b816 b871 )
    ( on b831 b816 )
    ( on b89 b831 )
    ( on b396 b89 )
    ( on b556 b396 )
    ( on b39 b556 )
    ( on b543 b39 )
    ( on b732 b543 )
    ( on b902 b732 )
    ( on b638 b902 )
    ( on b313 b638 )
    ( clear b313 )
  )
  ( :goal
    ( and
      ( clear b240 )
    )
  )
)
