( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b466 - block
    b753 - block
    b860 - block
    b987 - block
    b682 - block
    b71 - block
    b958 - block
    b897 - block
    b913 - block
    b661 - block
    b460 - block
    b968 - block
    b35 - block
    b622 - block
    b609 - block
    b851 - block
    b213 - block
    b328 - block
    b639 - block
    b498 - block
    b67 - block
    b105 - block
    b461 - block
    b516 - block
    b236 - block
    b430 - block
    b378 - block
    b947 - block
    b204 - block
    b708 - block
    b216 - block
    b662 - block
    b341 - block
    b536 - block
    b606 - block
    b146 - block
    b435 - block
    b984 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b466 )
    ( on b753 b466 )
    ( on b860 b753 )
    ( on b987 b860 )
    ( on b682 b987 )
    ( on b71 b682 )
    ( on b958 b71 )
    ( on b897 b958 )
    ( on b913 b897 )
    ( on b661 b913 )
    ( on b460 b661 )
    ( on b968 b460 )
    ( on b35 b968 )
    ( on b622 b35 )
    ( on b609 b622 )
    ( on b851 b609 )
    ( on b213 b851 )
    ( on b328 b213 )
    ( on b639 b328 )
    ( on b498 b639 )
    ( on b67 b498 )
    ( on b105 b67 )
    ( on b461 b105 )
    ( on b516 b461 )
    ( on b236 b516 )
    ( on b430 b236 )
    ( on b378 b430 )
    ( on b947 b378 )
    ( on b204 b947 )
    ( on b708 b204 )
    ( on b216 b708 )
    ( on b662 b216 )
    ( on b341 b662 )
    ( on b536 b341 )
    ( on b606 b536 )
    ( on b146 b606 )
    ( on b435 b146 )
    ( on b984 b435 )
    ( clear b984 )
  )
  ( :goal
    ( and
      ( clear b466 )
    )
  )
)
