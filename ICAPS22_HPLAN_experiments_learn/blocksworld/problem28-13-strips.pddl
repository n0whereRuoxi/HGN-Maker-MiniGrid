( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b351 - block
    b373 - block
    b129 - block
    b272 - block
    b262 - block
    b322 - block
    b52 - block
    b203 - block
    b543 - block
    b73 - block
    b806 - block
    b961 - block
    b525 - block
    b120 - block
    b662 - block
    b686 - block
    b422 - block
    b659 - block
    b612 - block
    b256 - block
    b723 - block
    b315 - block
    b661 - block
    b613 - block
    b406 - block
    b930 - block
    b778 - block
    b33 - block
    b495 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b351 )
    ( on b373 b351 )
    ( on b129 b373 )
    ( on b272 b129 )
    ( on b262 b272 )
    ( on b322 b262 )
    ( on b52 b322 )
    ( on b203 b52 )
    ( on b543 b203 )
    ( on b73 b543 )
    ( on b806 b73 )
    ( on b961 b806 )
    ( on b525 b961 )
    ( on b120 b525 )
    ( on b662 b120 )
    ( on b686 b662 )
    ( on b422 b686 )
    ( on b659 b422 )
    ( on b612 b659 )
    ( on b256 b612 )
    ( on b723 b256 )
    ( on b315 b723 )
    ( on b661 b315 )
    ( on b613 b661 )
    ( on b406 b613 )
    ( on b930 b406 )
    ( on b778 b930 )
    ( on b33 b778 )
    ( on b495 b33 )
    ( clear b495 )
  )
  ( :goal
    ( and
      ( clear b351 )
    )
  )
)
