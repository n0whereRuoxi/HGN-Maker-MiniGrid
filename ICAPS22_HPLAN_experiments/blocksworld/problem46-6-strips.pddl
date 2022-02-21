( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b410 - block
    b236 - block
    b763 - block
    b325 - block
    b274 - block
    b621 - block
    b447 - block
    b755 - block
    b97 - block
    b704 - block
    b596 - block
    b926 - block
    b422 - block
    b147 - block
    b415 - block
    b577 - block
    b404 - block
    b388 - block
    b132 - block
    b616 - block
    b51 - block
    b337 - block
    b371 - block
    b272 - block
    b36 - block
    b385 - block
    b427 - block
    b526 - block
    b669 - block
    b367 - block
    b110 - block
    b21 - block
    b759 - block
    b403 - block
    b488 - block
    b514 - block
    b525 - block
    b361 - block
    b52 - block
    b929 - block
    b826 - block
    b324 - block
    b824 - block
    b806 - block
    b641 - block
    b208 - block
    b196 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b410 )
    ( on b236 b410 )
    ( on b763 b236 )
    ( on b325 b763 )
    ( on b274 b325 )
    ( on b621 b274 )
    ( on b447 b621 )
    ( on b755 b447 )
    ( on b97 b755 )
    ( on b704 b97 )
    ( on b596 b704 )
    ( on b926 b596 )
    ( on b422 b926 )
    ( on b147 b422 )
    ( on b415 b147 )
    ( on b577 b415 )
    ( on b404 b577 )
    ( on b388 b404 )
    ( on b132 b388 )
    ( on b616 b132 )
    ( on b51 b616 )
    ( on b337 b51 )
    ( on b371 b337 )
    ( on b272 b371 )
    ( on b36 b272 )
    ( on b385 b36 )
    ( on b427 b385 )
    ( on b526 b427 )
    ( on b669 b526 )
    ( on b367 b669 )
    ( on b110 b367 )
    ( on b21 b110 )
    ( on b759 b21 )
    ( on b403 b759 )
    ( on b488 b403 )
    ( on b514 b488 )
    ( on b525 b514 )
    ( on b361 b525 )
    ( on b52 b361 )
    ( on b929 b52 )
    ( on b826 b929 )
    ( on b324 b826 )
    ( on b824 b324 )
    ( on b806 b824 )
    ( on b641 b806 )
    ( on b208 b641 )
    ( on b196 b208 )
    ( clear b196 )
  )
  ( :goal
    ( and
      ( clear b410 )
    )
  )
)
