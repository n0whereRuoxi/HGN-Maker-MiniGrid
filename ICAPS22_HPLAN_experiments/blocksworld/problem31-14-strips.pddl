( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b993 - block
    b249 - block
    b219 - block
    b117 - block
    b698 - block
    b300 - block
    b289 - block
    b189 - block
    b281 - block
    b14 - block
    b158 - block
    b774 - block
    b584 - block
    b225 - block
    b854 - block
    b242 - block
    b702 - block
    b505 - block
    b684 - block
    b215 - block
    b626 - block
    b786 - block
    b694 - block
    b621 - block
    b536 - block
    b493 - block
    b986 - block
    b321 - block
    b351 - block
    b90 - block
    b282 - block
    b155 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b993 )
    ( on b249 b993 )
    ( on b219 b249 )
    ( on b117 b219 )
    ( on b698 b117 )
    ( on b300 b698 )
    ( on b289 b300 )
    ( on b189 b289 )
    ( on b281 b189 )
    ( on b14 b281 )
    ( on b158 b14 )
    ( on b774 b158 )
    ( on b584 b774 )
    ( on b225 b584 )
    ( on b854 b225 )
    ( on b242 b854 )
    ( on b702 b242 )
    ( on b505 b702 )
    ( on b684 b505 )
    ( on b215 b684 )
    ( on b626 b215 )
    ( on b786 b626 )
    ( on b694 b786 )
    ( on b621 b694 )
    ( on b536 b621 )
    ( on b493 b536 )
    ( on b986 b493 )
    ( on b321 b986 )
    ( on b351 b321 )
    ( on b90 b351 )
    ( on b282 b90 )
    ( on b155 b282 )
    ( clear b155 )
  )
  ( :goal
    ( and
      ( clear b993 )
    )
  )
)
