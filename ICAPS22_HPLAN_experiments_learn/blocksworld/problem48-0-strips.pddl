( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b59 - block
    b104 - block
    b651 - block
    b693 - block
    b451 - block
    b162 - block
    b399 - block
    b880 - block
    b966 - block
    b435 - block
    b209 - block
    b937 - block
    b311 - block
    b212 - block
    b274 - block
    b985 - block
    b133 - block
    b28 - block
    b189 - block
    b850 - block
    b957 - block
    b82 - block
    b300 - block
    b681 - block
    b661 - block
    b605 - block
    b126 - block
    b932 - block
    b963 - block
    b615 - block
    b479 - block
    b315 - block
    b879 - block
    b645 - block
    b884 - block
    b925 - block
    b733 - block
    b911 - block
    b868 - block
    b180 - block
    b426 - block
    b183 - block
    b939 - block
    b814 - block
    b487 - block
    b602 - block
    b166 - block
    b635 - block
    b306 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b59 )
    ( on b104 b59 )
    ( on b651 b104 )
    ( on b693 b651 )
    ( on b451 b693 )
    ( on b162 b451 )
    ( on b399 b162 )
    ( on b880 b399 )
    ( on b966 b880 )
    ( on b435 b966 )
    ( on b209 b435 )
    ( on b937 b209 )
    ( on b311 b937 )
    ( on b212 b311 )
    ( on b274 b212 )
    ( on b985 b274 )
    ( on b133 b985 )
    ( on b28 b133 )
    ( on b189 b28 )
    ( on b850 b189 )
    ( on b957 b850 )
    ( on b82 b957 )
    ( on b300 b82 )
    ( on b681 b300 )
    ( on b661 b681 )
    ( on b605 b661 )
    ( on b126 b605 )
    ( on b932 b126 )
    ( on b963 b932 )
    ( on b615 b963 )
    ( on b479 b615 )
    ( on b315 b479 )
    ( on b879 b315 )
    ( on b645 b879 )
    ( on b884 b645 )
    ( on b925 b884 )
    ( on b733 b925 )
    ( on b911 b733 )
    ( on b868 b911 )
    ( on b180 b868 )
    ( on b426 b180 )
    ( on b183 b426 )
    ( on b939 b183 )
    ( on b814 b939 )
    ( on b487 b814 )
    ( on b602 b487 )
    ( on b166 b602 )
    ( on b635 b166 )
    ( on b306 b635 )
    ( clear b306 )
  )
  ( :goal
    ( and
      ( clear b59 )
    )
  )
)
