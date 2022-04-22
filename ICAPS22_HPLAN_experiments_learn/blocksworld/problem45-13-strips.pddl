( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b401 - block
    b742 - block
    b545 - block
    b254 - block
    b646 - block
    b703 - block
    b39 - block
    b877 - block
    b423 - block
    b763 - block
    b481 - block
    b597 - block
    b230 - block
    b13 - block
    b697 - block
    b1 - block
    b794 - block
    b977 - block
    b448 - block
    b867 - block
    b727 - block
    b463 - block
    b516 - block
    b535 - block
    b961 - block
    b583 - block
    b931 - block
    b498 - block
    b628 - block
    b844 - block
    b30 - block
    b321 - block
    b621 - block
    b396 - block
    b376 - block
    b478 - block
    b15 - block
    b732 - block
    b804 - block
    b250 - block
    b979 - block
    b322 - block
    b180 - block
    b957 - block
    b467 - block
    b68 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b401 )
    ( on b742 b401 )
    ( on b545 b742 )
    ( on b254 b545 )
    ( on b646 b254 )
    ( on b703 b646 )
    ( on b39 b703 )
    ( on b877 b39 )
    ( on b423 b877 )
    ( on b763 b423 )
    ( on b481 b763 )
    ( on b597 b481 )
    ( on b230 b597 )
    ( on b13 b230 )
    ( on b697 b13 )
    ( on b1 b697 )
    ( on b794 b1 )
    ( on b977 b794 )
    ( on b448 b977 )
    ( on b867 b448 )
    ( on b727 b867 )
    ( on b463 b727 )
    ( on b516 b463 )
    ( on b535 b516 )
    ( on b961 b535 )
    ( on b583 b961 )
    ( on b931 b583 )
    ( on b498 b931 )
    ( on b628 b498 )
    ( on b844 b628 )
    ( on b30 b844 )
    ( on b321 b30 )
    ( on b621 b321 )
    ( on b396 b621 )
    ( on b376 b396 )
    ( on b478 b376 )
    ( on b15 b478 )
    ( on b732 b15 )
    ( on b804 b732 )
    ( on b250 b804 )
    ( on b979 b250 )
    ( on b322 b979 )
    ( on b180 b322 )
    ( on b957 b180 )
    ( on b467 b957 )
    ( on b68 b467 )
    ( clear b68 )
  )
  ( :goal
    ( and
      ( clear b401 )
    )
  )
)
