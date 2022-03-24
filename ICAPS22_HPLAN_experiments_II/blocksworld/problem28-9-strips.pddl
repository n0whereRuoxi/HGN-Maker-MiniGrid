( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b891 - block
    b929 - block
    b578 - block
    b900 - block
    b992 - block
    b150 - block
    b679 - block
    b14 - block
    b684 - block
    b521 - block
    b107 - block
    b899 - block
    b951 - block
    b421 - block
    b386 - block
    b557 - block
    b735 - block
    b410 - block
    b703 - block
    b663 - block
    b810 - block
    b498 - block
    b967 - block
    b939 - block
    b474 - block
    b794 - block
    b798 - block
    b207 - block
    b825 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b891 )
    ( on b929 b891 )
    ( on b578 b929 )
    ( on b900 b578 )
    ( on b992 b900 )
    ( on b150 b992 )
    ( on b679 b150 )
    ( on b14 b679 )
    ( on b684 b14 )
    ( on b521 b684 )
    ( on b107 b521 )
    ( on b899 b107 )
    ( on b951 b899 )
    ( on b421 b951 )
    ( on b386 b421 )
    ( on b557 b386 )
    ( on b735 b557 )
    ( on b410 b735 )
    ( on b703 b410 )
    ( on b663 b703 )
    ( on b810 b663 )
    ( on b498 b810 )
    ( on b967 b498 )
    ( on b939 b967 )
    ( on b474 b939 )
    ( on b794 b474 )
    ( on b798 b794 )
    ( on b207 b798 )
    ( on b825 b207 )
    ( clear b825 )
  )
  ( :goal
    ( and
      ( clear b891 )
    )
  )
)
