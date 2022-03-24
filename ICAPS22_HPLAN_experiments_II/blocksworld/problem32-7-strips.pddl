( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b31 - block
    b386 - block
    b583 - block
    b656 - block
    b710 - block
    b978 - block
    b108 - block
    b954 - block
    b704 - block
    b752 - block
    b718 - block
    b332 - block
    b385 - block
    b856 - block
    b777 - block
    b236 - block
    b879 - block
    b664 - block
    b805 - block
    b923 - block
    b929 - block
    b536 - block
    b905 - block
    b797 - block
    b959 - block
    b315 - block
    b926 - block
    b944 - block
    b746 - block
    b601 - block
    b51 - block
    b412 - block
    b196 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b31 )
    ( on b386 b31 )
    ( on b583 b386 )
    ( on b656 b583 )
    ( on b710 b656 )
    ( on b978 b710 )
    ( on b108 b978 )
    ( on b954 b108 )
    ( on b704 b954 )
    ( on b752 b704 )
    ( on b718 b752 )
    ( on b332 b718 )
    ( on b385 b332 )
    ( on b856 b385 )
    ( on b777 b856 )
    ( on b236 b777 )
    ( on b879 b236 )
    ( on b664 b879 )
    ( on b805 b664 )
    ( on b923 b805 )
    ( on b929 b923 )
    ( on b536 b929 )
    ( on b905 b536 )
    ( on b797 b905 )
    ( on b959 b797 )
    ( on b315 b959 )
    ( on b926 b315 )
    ( on b944 b926 )
    ( on b746 b944 )
    ( on b601 b746 )
    ( on b51 b601 )
    ( on b412 b51 )
    ( on b196 b412 )
    ( clear b196 )
  )
  ( :goal
    ( and
      ( clear b31 )
    )
  )
)
