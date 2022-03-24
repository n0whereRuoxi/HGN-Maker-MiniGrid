( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b746 - block
    b885 - block
    b814 - block
    b237 - block
    b871 - block
    b113 - block
    b959 - block
    b114 - block
    b831 - block
    b489 - block
    b830 - block
    b798 - block
    b66 - block
    b638 - block
    b445 - block
    b860 - block
    b429 - block
    b28 - block
    b26 - block
    b683 - block
    b94 - block
    b748 - block
    b254 - block
    b90 - block
    b362 - block
    b808 - block
    b270 - block
    b652 - block
    b551 - block
    b912 - block
    b324 - block
    b53 - block
    b895 - block
    b561 - block
    b582 - block
    b247 - block
    b427 - block
    b921 - block
    b18 - block
    b861 - block
    b329 - block
    b611 - block
    b666 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b746 )
    ( on b885 b746 )
    ( on b814 b885 )
    ( on b237 b814 )
    ( on b871 b237 )
    ( on b113 b871 )
    ( on b959 b113 )
    ( on b114 b959 )
    ( on b831 b114 )
    ( on b489 b831 )
    ( on b830 b489 )
    ( on b798 b830 )
    ( on b66 b798 )
    ( on b638 b66 )
    ( on b445 b638 )
    ( on b860 b445 )
    ( on b429 b860 )
    ( on b28 b429 )
    ( on b26 b28 )
    ( on b683 b26 )
    ( on b94 b683 )
    ( on b748 b94 )
    ( on b254 b748 )
    ( on b90 b254 )
    ( on b362 b90 )
    ( on b808 b362 )
    ( on b270 b808 )
    ( on b652 b270 )
    ( on b551 b652 )
    ( on b912 b551 )
    ( on b324 b912 )
    ( on b53 b324 )
    ( on b895 b53 )
    ( on b561 b895 )
    ( on b582 b561 )
    ( on b247 b582 )
    ( on b427 b247 )
    ( on b921 b427 )
    ( on b18 b921 )
    ( on b861 b18 )
    ( on b329 b861 )
    ( on b611 b329 )
    ( on b666 b611 )
    ( clear b666 )
  )
  ( :tasks
    ( Make-42Pile b885 b814 b237 b871 b113 b959 b114 b831 b489 b830 b798 b66 b638 b445 b860 b429 b28 b26 b683 b94 b748 b254 b90 b362 b808 b270 b652 b551 b912 b324 b53 b895 b561 b582 b247 b427 b921 b18 b861 b329 b611 b666 )
  )
)
