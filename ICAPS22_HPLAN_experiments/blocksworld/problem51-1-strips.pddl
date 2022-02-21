( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b726 - block
    b966 - block
    b287 - block
    b473 - block
    b642 - block
    b77 - block
    b609 - block
    b283 - block
    b589 - block
    b663 - block
    b376 - block
    b217 - block
    b354 - block
    b620 - block
    b535 - block
    b622 - block
    b844 - block
    b435 - block
    b489 - block
    b433 - block
    b291 - block
    b308 - block
    b154 - block
    b766 - block
    b449 - block
    b982 - block
    b821 - block
    b429 - block
    b618 - block
    b723 - block
    b669 - block
    b556 - block
    b210 - block
    b907 - block
    b174 - block
    b672 - block
    b313 - block
    b739 - block
    b623 - block
    b94 - block
    b810 - block
    b417 - block
    b363 - block
    b746 - block
    b957 - block
    b467 - block
    b655 - block
    b597 - block
    b153 - block
    b800 - block
    b339 - block
    b343 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b726 )
    ( on b966 b726 )
    ( on b287 b966 )
    ( on b473 b287 )
    ( on b642 b473 )
    ( on b77 b642 )
    ( on b609 b77 )
    ( on b283 b609 )
    ( on b589 b283 )
    ( on b663 b589 )
    ( on b376 b663 )
    ( on b217 b376 )
    ( on b354 b217 )
    ( on b620 b354 )
    ( on b535 b620 )
    ( on b622 b535 )
    ( on b844 b622 )
    ( on b435 b844 )
    ( on b489 b435 )
    ( on b433 b489 )
    ( on b291 b433 )
    ( on b308 b291 )
    ( on b154 b308 )
    ( on b766 b154 )
    ( on b449 b766 )
    ( on b982 b449 )
    ( on b821 b982 )
    ( on b429 b821 )
    ( on b618 b429 )
    ( on b723 b618 )
    ( on b669 b723 )
    ( on b556 b669 )
    ( on b210 b556 )
    ( on b907 b210 )
    ( on b174 b907 )
    ( on b672 b174 )
    ( on b313 b672 )
    ( on b739 b313 )
    ( on b623 b739 )
    ( on b94 b623 )
    ( on b810 b94 )
    ( on b417 b810 )
    ( on b363 b417 )
    ( on b746 b363 )
    ( on b957 b746 )
    ( on b467 b957 )
    ( on b655 b467 )
    ( on b597 b655 )
    ( on b153 b597 )
    ( on b800 b153 )
    ( on b339 b800 )
    ( on b343 b339 )
    ( clear b343 )
  )
  ( :goal
    ( and
      ( clear b726 )
    )
  )
)
