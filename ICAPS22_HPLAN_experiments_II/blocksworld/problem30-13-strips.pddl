( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b794 - block
    b394 - block
    b428 - block
    b297 - block
    b165 - block
    b851 - block
    b474 - block
    b183 - block
    b728 - block
    b487 - block
    b783 - block
    b548 - block
    b292 - block
    b843 - block
    b753 - block
    b468 - block
    b560 - block
    b174 - block
    b95 - block
    b796 - block
    b889 - block
    b86 - block
    b574 - block
    b986 - block
    b45 - block
    b626 - block
    b547 - block
    b204 - block
    b789 - block
    b979 - block
    b684 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b794 )
    ( on b394 b794 )
    ( on b428 b394 )
    ( on b297 b428 )
    ( on b165 b297 )
    ( on b851 b165 )
    ( on b474 b851 )
    ( on b183 b474 )
    ( on b728 b183 )
    ( on b487 b728 )
    ( on b783 b487 )
    ( on b548 b783 )
    ( on b292 b548 )
    ( on b843 b292 )
    ( on b753 b843 )
    ( on b468 b753 )
    ( on b560 b468 )
    ( on b174 b560 )
    ( on b95 b174 )
    ( on b796 b95 )
    ( on b889 b796 )
    ( on b86 b889 )
    ( on b574 b86 )
    ( on b986 b574 )
    ( on b45 b986 )
    ( on b626 b45 )
    ( on b547 b626 )
    ( on b204 b547 )
    ( on b789 b204 )
    ( on b979 b789 )
    ( on b684 b979 )
    ( clear b684 )
  )
  ( :goal
    ( and
      ( clear b794 )
    )
  )
)
