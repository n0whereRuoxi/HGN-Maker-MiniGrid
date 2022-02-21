( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b105 - block
    b38 - block
    b785 - block
    b832 - block
    b866 - block
    b885 - block
    b570 - block
    b524 - block
    b348 - block
    b204 - block
    b25 - block
    b33 - block
    b30 - block
    b821 - block
    b682 - block
    b85 - block
    b412 - block
    b470 - block
    b801 - block
    b462 - block
    b13 - block
    b631 - block
    b418 - block
    b873 - block
    b168 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b105 )
    ( on b38 b105 )
    ( on b785 b38 )
    ( on b832 b785 )
    ( on b866 b832 )
    ( on b885 b866 )
    ( on b570 b885 )
    ( on b524 b570 )
    ( on b348 b524 )
    ( on b204 b348 )
    ( on b25 b204 )
    ( on b33 b25 )
    ( on b30 b33 )
    ( on b821 b30 )
    ( on b682 b821 )
    ( on b85 b682 )
    ( on b412 b85 )
    ( on b470 b412 )
    ( on b801 b470 )
    ( on b462 b801 )
    ( on b13 b462 )
    ( on b631 b13 )
    ( on b418 b631 )
    ( on b873 b418 )
    ( on b168 b873 )
    ( on b716 b168 )
    ( clear b716 )
  )
  ( :goal
    ( and
      ( clear b105 )
    )
  )
)
