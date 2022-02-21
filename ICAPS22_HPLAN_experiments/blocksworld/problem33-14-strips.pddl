( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b788 - block
    b724 - block
    b799 - block
    b413 - block
    b666 - block
    b604 - block
    b426 - block
    b507 - block
    b155 - block
    b449 - block
    b212 - block
    b482 - block
    b90 - block
    b427 - block
    b324 - block
    b29 - block
    b554 - block
    b663 - block
    b687 - block
    b627 - block
    b928 - block
    b506 - block
    b529 - block
    b737 - block
    b611 - block
    b902 - block
    b47 - block
    b646 - block
    b407 - block
    b960 - block
    b736 - block
    b909 - block
    b471 - block
    b694 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b788 )
    ( on b724 b788 )
    ( on b799 b724 )
    ( on b413 b799 )
    ( on b666 b413 )
    ( on b604 b666 )
    ( on b426 b604 )
    ( on b507 b426 )
    ( on b155 b507 )
    ( on b449 b155 )
    ( on b212 b449 )
    ( on b482 b212 )
    ( on b90 b482 )
    ( on b427 b90 )
    ( on b324 b427 )
    ( on b29 b324 )
    ( on b554 b29 )
    ( on b663 b554 )
    ( on b687 b663 )
    ( on b627 b687 )
    ( on b928 b627 )
    ( on b506 b928 )
    ( on b529 b506 )
    ( on b737 b529 )
    ( on b611 b737 )
    ( on b902 b611 )
    ( on b47 b902 )
    ( on b646 b47 )
    ( on b407 b646 )
    ( on b960 b407 )
    ( on b736 b960 )
    ( on b909 b736 )
    ( on b471 b909 )
    ( on b694 b471 )
    ( clear b694 )
  )
  ( :goal
    ( and
      ( clear b788 )
    )
  )
)
