( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b33 - block
    b965 - block
    b339 - block
    b4 - block
    b389 - block
    b285 - block
    b324 - block
    b994 - block
    b316 - block
    b888 - block
    b616 - block
    b907 - block
    b138 - block
    b639 - block
    b549 - block
    b124 - block
    b439 - block
    b798 - block
    b361 - block
    b930 - block
    b463 - block
    b60 - block
    b8 - block
    b207 - block
    b53 - block
    b86 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b33 b403 )
    ( on b965 b33 )
    ( on b339 b965 )
    ( on b4 b339 )
    ( on b389 b4 )
    ( on b285 b389 )
    ( on b324 b285 )
    ( on b994 b324 )
    ( on b316 b994 )
    ( on b888 b316 )
    ( on b616 b888 )
    ( on b907 b616 )
    ( on b138 b907 )
    ( on b639 b138 )
    ( on b549 b639 )
    ( on b124 b549 )
    ( on b439 b124 )
    ( on b798 b439 )
    ( on b361 b798 )
    ( on b930 b361 )
    ( on b463 b930 )
    ( on b60 b463 )
    ( on b8 b60 )
    ( on b207 b8 )
    ( on b53 b207 )
    ( on b86 b53 )
    ( clear b86 )
  )
  ( :tasks
    ( Make-26Pile b33 b965 b339 b4 b389 b285 b324 b994 b316 b888 b616 b907 b138 b639 b549 b124 b439 b798 b361 b930 b463 b60 b8 b207 b53 b86 )
  )
)
