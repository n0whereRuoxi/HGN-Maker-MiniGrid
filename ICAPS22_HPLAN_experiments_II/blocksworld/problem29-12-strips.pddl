( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b264 - block
    b883 - block
    b546 - block
    b199 - block
    b630 - block
    b45 - block
    b92 - block
    b888 - block
    b798 - block
    b581 - block
    b136 - block
    b795 - block
    b244 - block
    b310 - block
    b893 - block
    b972 - block
    b488 - block
    b662 - block
    b353 - block
    b270 - block
    b771 - block
    b742 - block
    b843 - block
    b749 - block
    b478 - block
    b528 - block
    b330 - block
    b645 - block
    b728 - block
    b973 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b264 )
    ( on b883 b264 )
    ( on b546 b883 )
    ( on b199 b546 )
    ( on b630 b199 )
    ( on b45 b630 )
    ( on b92 b45 )
    ( on b888 b92 )
    ( on b798 b888 )
    ( on b581 b798 )
    ( on b136 b581 )
    ( on b795 b136 )
    ( on b244 b795 )
    ( on b310 b244 )
    ( on b893 b310 )
    ( on b972 b893 )
    ( on b488 b972 )
    ( on b662 b488 )
    ( on b353 b662 )
    ( on b270 b353 )
    ( on b771 b270 )
    ( on b742 b771 )
    ( on b843 b742 )
    ( on b749 b843 )
    ( on b478 b749 )
    ( on b528 b478 )
    ( on b330 b528 )
    ( on b645 b330 )
    ( on b728 b645 )
    ( on b973 b728 )
    ( clear b973 )
  )
  ( :goal
    ( and
      ( clear b264 )
    )
  )
)
