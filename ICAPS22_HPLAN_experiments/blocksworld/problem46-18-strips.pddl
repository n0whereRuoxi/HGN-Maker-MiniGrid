( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b728 - block
    b491 - block
    b768 - block
    b791 - block
    b740 - block
    b490 - block
    b631 - block
    b682 - block
    b364 - block
    b193 - block
    b751 - block
    b184 - block
    b119 - block
    b949 - block
    b282 - block
    b539 - block
    b166 - block
    b343 - block
    b882 - block
    b716 - block
    b650 - block
    b918 - block
    b833 - block
    b627 - block
    b333 - block
    b769 - block
    b194 - block
    b100 - block
    b182 - block
    b868 - block
    b86 - block
    b972 - block
    b253 - block
    b380 - block
    b663 - block
    b673 - block
    b214 - block
    b37 - block
    b935 - block
    b474 - block
    b301 - block
    b241 - block
    b365 - block
    b375 - block
    b754 - block
    b906 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b728 )
    ( on b491 b728 )
    ( on b768 b491 )
    ( on b791 b768 )
    ( on b740 b791 )
    ( on b490 b740 )
    ( on b631 b490 )
    ( on b682 b631 )
    ( on b364 b682 )
    ( on b193 b364 )
    ( on b751 b193 )
    ( on b184 b751 )
    ( on b119 b184 )
    ( on b949 b119 )
    ( on b282 b949 )
    ( on b539 b282 )
    ( on b166 b539 )
    ( on b343 b166 )
    ( on b882 b343 )
    ( on b716 b882 )
    ( on b650 b716 )
    ( on b918 b650 )
    ( on b833 b918 )
    ( on b627 b833 )
    ( on b333 b627 )
    ( on b769 b333 )
    ( on b194 b769 )
    ( on b100 b194 )
    ( on b182 b100 )
    ( on b868 b182 )
    ( on b86 b868 )
    ( on b972 b86 )
    ( on b253 b972 )
    ( on b380 b253 )
    ( on b663 b380 )
    ( on b673 b663 )
    ( on b214 b673 )
    ( on b37 b214 )
    ( on b935 b37 )
    ( on b474 b935 )
    ( on b301 b474 )
    ( on b241 b301 )
    ( on b365 b241 )
    ( on b375 b365 )
    ( on b754 b375 )
    ( on b906 b754 )
    ( on b80 b906 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b728 )
    )
  )
)
