( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b633 - block
    b758 - block
    b484 - block
    b730 - block
    b641 - block
    b977 - block
    b720 - block
    b858 - block
    b358 - block
    b496 - block
    b361 - block
    b364 - block
    b902 - block
    b559 - block
    b743 - block
    b399 - block
    b198 - block
    b982 - block
    b760 - block
    b757 - block
    b121 - block
    b658 - block
    b86 - block
    b567 - block
    b210 - block
    b694 - block
    b318 - block
    b767 - block
    b766 - block
    b922 - block
    b771 - block
    b283 - block
    b712 - block
    b252 - block
    b400 - block
    b482 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b633 )
    ( on b758 b633 )
    ( on b484 b758 )
    ( on b730 b484 )
    ( on b641 b730 )
    ( on b977 b641 )
    ( on b720 b977 )
    ( on b858 b720 )
    ( on b358 b858 )
    ( on b496 b358 )
    ( on b361 b496 )
    ( on b364 b361 )
    ( on b902 b364 )
    ( on b559 b902 )
    ( on b743 b559 )
    ( on b399 b743 )
    ( on b198 b399 )
    ( on b982 b198 )
    ( on b760 b982 )
    ( on b757 b760 )
    ( on b121 b757 )
    ( on b658 b121 )
    ( on b86 b658 )
    ( on b567 b86 )
    ( on b210 b567 )
    ( on b694 b210 )
    ( on b318 b694 )
    ( on b767 b318 )
    ( on b766 b767 )
    ( on b922 b766 )
    ( on b771 b922 )
    ( on b283 b771 )
    ( on b712 b283 )
    ( on b252 b712 )
    ( on b400 b252 )
    ( on b482 b400 )
    ( clear b482 )
  )
  ( :goal
    ( and
      ( clear b633 )
    )
  )
)
