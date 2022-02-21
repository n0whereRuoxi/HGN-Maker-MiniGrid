( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b699 - block
    b616 - block
    b789 - block
    b845 - block
    b811 - block
    b349 - block
    b945 - block
    b741 - block
    b632 - block
    b542 - block
    b441 - block
    b573 - block
    b142 - block
    b487 - block
    b392 - block
    b368 - block
    b759 - block
    b95 - block
    b6 - block
    b21 - block
    b804 - block
    b495 - block
    b42 - block
    b643 - block
    b634 - block
    b948 - block
    b486 - block
    b859 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b699 )
    ( on b616 b699 )
    ( on b789 b616 )
    ( on b845 b789 )
    ( on b811 b845 )
    ( on b349 b811 )
    ( on b945 b349 )
    ( on b741 b945 )
    ( on b632 b741 )
    ( on b542 b632 )
    ( on b441 b542 )
    ( on b573 b441 )
    ( on b142 b573 )
    ( on b487 b142 )
    ( on b392 b487 )
    ( on b368 b392 )
    ( on b759 b368 )
    ( on b95 b759 )
    ( on b6 b95 )
    ( on b21 b6 )
    ( on b804 b21 )
    ( on b495 b804 )
    ( on b42 b495 )
    ( on b643 b42 )
    ( on b634 b643 )
    ( on b948 b634 )
    ( on b486 b948 )
    ( on b859 b486 )
    ( clear b859 )
  )
  ( :goal
    ( and
      ( clear b699 )
    )
  )
)
