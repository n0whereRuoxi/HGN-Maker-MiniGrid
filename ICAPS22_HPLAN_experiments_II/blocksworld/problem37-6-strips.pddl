( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b315 - block
    b769 - block
    b687 - block
    b583 - block
    b302 - block
    b896 - block
    b385 - block
    b43 - block
    b412 - block
    b272 - block
    b187 - block
    b113 - block
    b38 - block
    b143 - block
    b66 - block
    b383 - block
    b979 - block
    b856 - block
    b105 - block
    b224 - block
    b658 - block
    b449 - block
    b752 - block
    b485 - block
    b378 - block
    b637 - block
    b712 - block
    b504 - block
    b592 - block
    b145 - block
    b358 - block
    b376 - block
    b183 - block
    b495 - block
    b425 - block
    b787 - block
    b367 - block
    b368 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b315 )
    ( on b769 b315 )
    ( on b687 b769 )
    ( on b583 b687 )
    ( on b302 b583 )
    ( on b896 b302 )
    ( on b385 b896 )
    ( on b43 b385 )
    ( on b412 b43 )
    ( on b272 b412 )
    ( on b187 b272 )
    ( on b113 b187 )
    ( on b38 b113 )
    ( on b143 b38 )
    ( on b66 b143 )
    ( on b383 b66 )
    ( on b979 b383 )
    ( on b856 b979 )
    ( on b105 b856 )
    ( on b224 b105 )
    ( on b658 b224 )
    ( on b449 b658 )
    ( on b752 b449 )
    ( on b485 b752 )
    ( on b378 b485 )
    ( on b637 b378 )
    ( on b712 b637 )
    ( on b504 b712 )
    ( on b592 b504 )
    ( on b145 b592 )
    ( on b358 b145 )
    ( on b376 b358 )
    ( on b183 b376 )
    ( on b495 b183 )
    ( on b425 b495 )
    ( on b787 b425 )
    ( on b367 b787 )
    ( on b368 b367 )
    ( clear b368 )
  )
  ( :goal
    ( and
      ( clear b315 )
    )
  )
)
