( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b173 - block
    b75 - block
    b631 - block
    b726 - block
    b855 - block
    b461 - block
    b682 - block
    b774 - block
    b810 - block
    b890 - block
    b424 - block
    b911 - block
    b722 - block
    b526 - block
    b254 - block
    b166 - block
    b30 - block
    b377 - block
    b183 - block
    b116 - block
    b876 - block
    b862 - block
    b484 - block
    b605 - block
    b566 - block
    b839 - block
    b121 - block
    b877 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b173 )
    ( on b75 b173 )
    ( on b631 b75 )
    ( on b726 b631 )
    ( on b855 b726 )
    ( on b461 b855 )
    ( on b682 b461 )
    ( on b774 b682 )
    ( on b810 b774 )
    ( on b890 b810 )
    ( on b424 b890 )
    ( on b911 b424 )
    ( on b722 b911 )
    ( on b526 b722 )
    ( on b254 b526 )
    ( on b166 b254 )
    ( on b30 b166 )
    ( on b377 b30 )
    ( on b183 b377 )
    ( on b116 b183 )
    ( on b876 b116 )
    ( on b862 b876 )
    ( on b484 b862 )
    ( on b605 b484 )
    ( on b566 b605 )
    ( on b839 b566 )
    ( on b121 b839 )
    ( on b877 b121 )
    ( on b201 b877 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b173 )
    )
  )
)
