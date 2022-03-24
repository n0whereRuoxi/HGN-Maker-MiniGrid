( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b527 - block
    b771 - block
    b583 - block
    b225 - block
    b872 - block
    b157 - block
    b59 - block
    b46 - block
    b591 - block
    b662 - block
    b647 - block
    b16 - block
    b964 - block
    b303 - block
    b656 - block
    b181 - block
    b214 - block
    b816 - block
    b172 - block
    b470 - block
    b702 - block
    b365 - block
    b134 - block
    b91 - block
    b138 - block
    b446 - block
    b910 - block
    b15 - block
    b154 - block
    b945 - block
    b75 - block
    b185 - block
    b630 - block
    b994 - block
    b340 - block
    b975 - block
    b558 - block
    b436 - block
    b843 - block
    b244 - block
    b660 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b527 )
    ( on b771 b527 )
    ( on b583 b771 )
    ( on b225 b583 )
    ( on b872 b225 )
    ( on b157 b872 )
    ( on b59 b157 )
    ( on b46 b59 )
    ( on b591 b46 )
    ( on b662 b591 )
    ( on b647 b662 )
    ( on b16 b647 )
    ( on b964 b16 )
    ( on b303 b964 )
    ( on b656 b303 )
    ( on b181 b656 )
    ( on b214 b181 )
    ( on b816 b214 )
    ( on b172 b816 )
    ( on b470 b172 )
    ( on b702 b470 )
    ( on b365 b702 )
    ( on b134 b365 )
    ( on b91 b134 )
    ( on b138 b91 )
    ( on b446 b138 )
    ( on b910 b446 )
    ( on b15 b910 )
    ( on b154 b15 )
    ( on b945 b154 )
    ( on b75 b945 )
    ( on b185 b75 )
    ( on b630 b185 )
    ( on b994 b630 )
    ( on b340 b994 )
    ( on b975 b340 )
    ( on b558 b975 )
    ( on b436 b558 )
    ( on b843 b436 )
    ( on b244 b843 )
    ( on b660 b244 )
    ( clear b660 )
  )
  ( :goal
    ( and
      ( clear b527 )
    )
  )
)
