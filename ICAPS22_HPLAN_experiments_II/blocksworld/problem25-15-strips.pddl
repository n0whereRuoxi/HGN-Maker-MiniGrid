( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b775 - block
    b889 - block
    b650 - block
    b101 - block
    b15 - block
    b327 - block
    b966 - block
    b320 - block
    b908 - block
    b631 - block
    b687 - block
    b214 - block
    b499 - block
    b316 - block
    b584 - block
    b686 - block
    b338 - block
    b303 - block
    b658 - block
    b796 - block
    b491 - block
    b927 - block
    b867 - block
    b949 - block
    b438 - block
    b373 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b775 )
    ( on b889 b775 )
    ( on b650 b889 )
    ( on b101 b650 )
    ( on b15 b101 )
    ( on b327 b15 )
    ( on b966 b327 )
    ( on b320 b966 )
    ( on b908 b320 )
    ( on b631 b908 )
    ( on b687 b631 )
    ( on b214 b687 )
    ( on b499 b214 )
    ( on b316 b499 )
    ( on b584 b316 )
    ( on b686 b584 )
    ( on b338 b686 )
    ( on b303 b338 )
    ( on b658 b303 )
    ( on b796 b658 )
    ( on b491 b796 )
    ( on b927 b491 )
    ( on b867 b927 )
    ( on b949 b867 )
    ( on b438 b949 )
    ( on b373 b438 )
    ( clear b373 )
  )
  ( :goal
    ( and
      ( clear b775 )
    )
  )
)
