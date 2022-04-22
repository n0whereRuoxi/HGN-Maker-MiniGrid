( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b762 - block
    b396 - block
    b573 - block
    b312 - block
    b626 - block
    b648 - block
    b248 - block
    b986 - block
    b157 - block
    b52 - block
    b95 - block
    b349 - block
    b788 - block
    b653 - block
    b170 - block
    b82 - block
    b187 - block
    b325 - block
    b766 - block
    b971 - block
    b275 - block
    b178 - block
    b741 - block
    b288 - block
    b673 - block
    b123 - block
    b297 - block
    b69 - block
    b341 - block
    b867 - block
    b833 - block
    b831 - block
    b422 - block
    b484 - block
    b216 - block
    b139 - block
    b993 - block
    b86 - block
    b7 - block
    b242 - block
    b821 - block
    b829 - block
    b298 - block
    b394 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b762 )
    ( on b396 b762 )
    ( on b573 b396 )
    ( on b312 b573 )
    ( on b626 b312 )
    ( on b648 b626 )
    ( on b248 b648 )
    ( on b986 b248 )
    ( on b157 b986 )
    ( on b52 b157 )
    ( on b95 b52 )
    ( on b349 b95 )
    ( on b788 b349 )
    ( on b653 b788 )
    ( on b170 b653 )
    ( on b82 b170 )
    ( on b187 b82 )
    ( on b325 b187 )
    ( on b766 b325 )
    ( on b971 b766 )
    ( on b275 b971 )
    ( on b178 b275 )
    ( on b741 b178 )
    ( on b288 b741 )
    ( on b673 b288 )
    ( on b123 b673 )
    ( on b297 b123 )
    ( on b69 b297 )
    ( on b341 b69 )
    ( on b867 b341 )
    ( on b833 b867 )
    ( on b831 b833 )
    ( on b422 b831 )
    ( on b484 b422 )
    ( on b216 b484 )
    ( on b139 b216 )
    ( on b993 b139 )
    ( on b86 b993 )
    ( on b7 b86 )
    ( on b242 b7 )
    ( on b821 b242 )
    ( on b829 b821 )
    ( on b298 b829 )
    ( on b394 b298 )
    ( on b464 b394 )
    ( clear b464 )
  )
  ( :goal
    ( and
      ( clear b762 )
    )
  )
)
