( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b212 - block
    b676 - block
    b428 - block
    b176 - block
    b609 - block
    b839 - block
    b535 - block
    b355 - block
    b652 - block
    b359 - block
    b527 - block
    b934 - block
    b879 - block
    b106 - block
    b246 - block
    b260 - block
    b545 - block
    b843 - block
    b80 - block
    b559 - block
    b297 - block
    b820 - block
    b499 - block
    b540 - block
    b406 - block
    b728 - block
    b335 - block
    b236 - block
    b737 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b212 )
    ( on b676 b212 )
    ( on b428 b676 )
    ( on b176 b428 )
    ( on b609 b176 )
    ( on b839 b609 )
    ( on b535 b839 )
    ( on b355 b535 )
    ( on b652 b355 )
    ( on b359 b652 )
    ( on b527 b359 )
    ( on b934 b527 )
    ( on b879 b934 )
    ( on b106 b879 )
    ( on b246 b106 )
    ( on b260 b246 )
    ( on b545 b260 )
    ( on b843 b545 )
    ( on b80 b843 )
    ( on b559 b80 )
    ( on b297 b559 )
    ( on b820 b297 )
    ( on b499 b820 )
    ( on b540 b499 )
    ( on b406 b540 )
    ( on b728 b406 )
    ( on b335 b728 )
    ( on b236 b335 )
    ( on b737 b236 )
    ( on b730 b737 )
    ( clear b730 )
  )
  ( :goal
    ( and
      ( clear b212 )
    )
  )
)
