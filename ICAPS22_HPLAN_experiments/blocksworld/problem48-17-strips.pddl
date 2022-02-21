( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b182 - block
    b99 - block
    b915 - block
    b114 - block
    b501 - block
    b499 - block
    b703 - block
    b839 - block
    b931 - block
    b115 - block
    b391 - block
    b298 - block
    b415 - block
    b755 - block
    b124 - block
    b134 - block
    b598 - block
    b650 - block
    b286 - block
    b1 - block
    b340 - block
    b328 - block
    b234 - block
    b872 - block
    b254 - block
    b752 - block
    b498 - block
    b302 - block
    b10 - block
    b900 - block
    b825 - block
    b896 - block
    b389 - block
    b556 - block
    b132 - block
    b299 - block
    b430 - block
    b403 - block
    b358 - block
    b467 - block
    b121 - block
    b619 - block
    b308 - block
    b985 - block
    b508 - block
    b338 - block
    b905 - block
    b704 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b182 b221 )
    ( on b99 b182 )
    ( on b915 b99 )
    ( on b114 b915 )
    ( on b501 b114 )
    ( on b499 b501 )
    ( on b703 b499 )
    ( on b839 b703 )
    ( on b931 b839 )
    ( on b115 b931 )
    ( on b391 b115 )
    ( on b298 b391 )
    ( on b415 b298 )
    ( on b755 b415 )
    ( on b124 b755 )
    ( on b134 b124 )
    ( on b598 b134 )
    ( on b650 b598 )
    ( on b286 b650 )
    ( on b1 b286 )
    ( on b340 b1 )
    ( on b328 b340 )
    ( on b234 b328 )
    ( on b872 b234 )
    ( on b254 b872 )
    ( on b752 b254 )
    ( on b498 b752 )
    ( on b302 b498 )
    ( on b10 b302 )
    ( on b900 b10 )
    ( on b825 b900 )
    ( on b896 b825 )
    ( on b389 b896 )
    ( on b556 b389 )
    ( on b132 b556 )
    ( on b299 b132 )
    ( on b430 b299 )
    ( on b403 b430 )
    ( on b358 b403 )
    ( on b467 b358 )
    ( on b121 b467 )
    ( on b619 b121 )
    ( on b308 b619 )
    ( on b985 b308 )
    ( on b508 b985 )
    ( on b338 b508 )
    ( on b905 b338 )
    ( on b704 b905 )
    ( clear b704 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
