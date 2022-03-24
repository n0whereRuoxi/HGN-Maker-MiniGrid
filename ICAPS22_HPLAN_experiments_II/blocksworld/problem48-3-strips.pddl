( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b443 - block
    b189 - block
    b802 - block
    b364 - block
    b910 - block
    b113 - block
    b329 - block
    b11 - block
    b901 - block
    b638 - block
    b146 - block
    b343 - block
    b693 - block
    b717 - block
    b689 - block
    b397 - block
    b338 - block
    b816 - block
    b975 - block
    b14 - block
    b169 - block
    b883 - block
    b972 - block
    b636 - block
    b476 - block
    b268 - block
    b46 - block
    b358 - block
    b6 - block
    b701 - block
    b597 - block
    b583 - block
    b294 - block
    b253 - block
    b42 - block
    b263 - block
    b479 - block
    b10 - block
    b993 - block
    b195 - block
    b911 - block
    b116 - block
    b240 - block
    b861 - block
    b601 - block
    b603 - block
    b236 - block
    b254 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b443 b389 )
    ( on b189 b443 )
    ( on b802 b189 )
    ( on b364 b802 )
    ( on b910 b364 )
    ( on b113 b910 )
    ( on b329 b113 )
    ( on b11 b329 )
    ( on b901 b11 )
    ( on b638 b901 )
    ( on b146 b638 )
    ( on b343 b146 )
    ( on b693 b343 )
    ( on b717 b693 )
    ( on b689 b717 )
    ( on b397 b689 )
    ( on b338 b397 )
    ( on b816 b338 )
    ( on b975 b816 )
    ( on b14 b975 )
    ( on b169 b14 )
    ( on b883 b169 )
    ( on b972 b883 )
    ( on b636 b972 )
    ( on b476 b636 )
    ( on b268 b476 )
    ( on b46 b268 )
    ( on b358 b46 )
    ( on b6 b358 )
    ( on b701 b6 )
    ( on b597 b701 )
    ( on b583 b597 )
    ( on b294 b583 )
    ( on b253 b294 )
    ( on b42 b253 )
    ( on b263 b42 )
    ( on b479 b263 )
    ( on b10 b479 )
    ( on b993 b10 )
    ( on b195 b993 )
    ( on b911 b195 )
    ( on b116 b911 )
    ( on b240 b116 )
    ( on b861 b240 )
    ( on b601 b861 )
    ( on b603 b601 )
    ( on b236 b603 )
    ( on b254 b236 )
    ( clear b254 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
