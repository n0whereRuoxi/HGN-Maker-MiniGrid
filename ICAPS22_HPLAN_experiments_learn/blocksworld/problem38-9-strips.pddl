( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b332 - block
    b809 - block
    b887 - block
    b288 - block
    b746 - block
    b602 - block
    b276 - block
    b497 - block
    b743 - block
    b649 - block
    b641 - block
    b799 - block
    b840 - block
    b142 - block
    b153 - block
    b385 - block
    b741 - block
    b694 - block
    b587 - block
    b999 - block
    b247 - block
    b341 - block
    b829 - block
    b805 - block
    b477 - block
    b815 - block
    b382 - block
    b645 - block
    b498 - block
    b256 - block
    b113 - block
    b945 - block
    b161 - block
    b516 - block
    b994 - block
    b986 - block
    b499 - block
    b825 - block
    b61 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b332 )
    ( on b809 b332 )
    ( on b887 b809 )
    ( on b288 b887 )
    ( on b746 b288 )
    ( on b602 b746 )
    ( on b276 b602 )
    ( on b497 b276 )
    ( on b743 b497 )
    ( on b649 b743 )
    ( on b641 b649 )
    ( on b799 b641 )
    ( on b840 b799 )
    ( on b142 b840 )
    ( on b153 b142 )
    ( on b385 b153 )
    ( on b741 b385 )
    ( on b694 b741 )
    ( on b587 b694 )
    ( on b999 b587 )
    ( on b247 b999 )
    ( on b341 b247 )
    ( on b829 b341 )
    ( on b805 b829 )
    ( on b477 b805 )
    ( on b815 b477 )
    ( on b382 b815 )
    ( on b645 b382 )
    ( on b498 b645 )
    ( on b256 b498 )
    ( on b113 b256 )
    ( on b945 b113 )
    ( on b161 b945 )
    ( on b516 b161 )
    ( on b994 b516 )
    ( on b986 b994 )
    ( on b499 b986 )
    ( on b825 b499 )
    ( on b61 b825 )
    ( clear b61 )
  )
  ( :goal
    ( and
      ( clear b332 )
    )
  )
)
