( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b948 - block
    b35 - block
    b297 - block
    b915 - block
    b237 - block
    b519 - block
    b292 - block
    b699 - block
    b25 - block
    b514 - block
    b428 - block
    b815 - block
    b56 - block
    b240 - block
    b858 - block
    b464 - block
    b270 - block
    b702 - block
    b406 - block
    b778 - block
    b447 - block
    b245 - block
    b60 - block
    b938 - block
    b801 - block
    b106 - block
    b827 - block
    b443 - block
    b507 - block
    b360 - block
    b770 - block
    b347 - block
    b365 - block
    b280 - block
    b31 - block
    b920 - block
    b922 - block
    b394 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b948 )
    ( on b35 b948 )
    ( on b297 b35 )
    ( on b915 b297 )
    ( on b237 b915 )
    ( on b519 b237 )
    ( on b292 b519 )
    ( on b699 b292 )
    ( on b25 b699 )
    ( on b514 b25 )
    ( on b428 b514 )
    ( on b815 b428 )
    ( on b56 b815 )
    ( on b240 b56 )
    ( on b858 b240 )
    ( on b464 b858 )
    ( on b270 b464 )
    ( on b702 b270 )
    ( on b406 b702 )
    ( on b778 b406 )
    ( on b447 b778 )
    ( on b245 b447 )
    ( on b60 b245 )
    ( on b938 b60 )
    ( on b801 b938 )
    ( on b106 b801 )
    ( on b827 b106 )
    ( on b443 b827 )
    ( on b507 b443 )
    ( on b360 b507 )
    ( on b770 b360 )
    ( on b347 b770 )
    ( on b365 b347 )
    ( on b280 b365 )
    ( on b31 b280 )
    ( on b920 b31 )
    ( on b922 b920 )
    ( on b394 b922 )
    ( clear b394 )
  )
  ( :goal
    ( and
      ( clear b948 )
    )
  )
)
