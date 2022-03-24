( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b129 - block
    b656 - block
    b155 - block
    b694 - block
    b948 - block
    b134 - block
    b460 - block
    b724 - block
    b873 - block
    b474 - block
    b335 - block
    b453 - block
    b277 - block
    b29 - block
    b304 - block
    b824 - block
    b109 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b129 )
    ( on b656 b129 )
    ( on b155 b656 )
    ( on b694 b155 )
    ( on b948 b694 )
    ( on b134 b948 )
    ( on b460 b134 )
    ( on b724 b460 )
    ( on b873 b724 )
    ( on b474 b873 )
    ( on b335 b474 )
    ( on b453 b335 )
    ( on b277 b453 )
    ( on b29 b277 )
    ( on b304 b29 )
    ( on b824 b304 )
    ( on b109 b824 )
    ( clear b109 )
  )
  ( :goal
    ( and
      ( clear b129 )
    )
  )
)
