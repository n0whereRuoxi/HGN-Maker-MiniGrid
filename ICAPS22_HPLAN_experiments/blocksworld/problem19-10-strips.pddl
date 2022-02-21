( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b806 - block
    b91 - block
    b893 - block
    b915 - block
    b747 - block
    b506 - block
    b389 - block
    b85 - block
    b911 - block
    b843 - block
    b559 - block
    b859 - block
    b880 - block
    b519 - block
    b917 - block
    b763 - block
    b438 - block
    b256 - block
    b734 - block
    b602 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b806 )
    ( on b91 b806 )
    ( on b893 b91 )
    ( on b915 b893 )
    ( on b747 b915 )
    ( on b506 b747 )
    ( on b389 b506 )
    ( on b85 b389 )
    ( on b911 b85 )
    ( on b843 b911 )
    ( on b559 b843 )
    ( on b859 b559 )
    ( on b880 b859 )
    ( on b519 b880 )
    ( on b917 b519 )
    ( on b763 b917 )
    ( on b438 b763 )
    ( on b256 b438 )
    ( on b734 b256 )
    ( on b602 b734 )
    ( clear b602 )
  )
  ( :goal
    ( and
      ( clear b806 )
    )
  )
)
