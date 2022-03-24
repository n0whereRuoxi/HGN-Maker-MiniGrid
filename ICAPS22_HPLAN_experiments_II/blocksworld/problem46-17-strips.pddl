( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b857 - block
    b399 - block
    b83 - block
    b411 - block
    b115 - block
    b718 - block
    b271 - block
    b181 - block
    b91 - block
    b965 - block
    b336 - block
    b670 - block
    b164 - block
    b991 - block
    b468 - block
    b662 - block
    b154 - block
    b496 - block
    b457 - block
    b818 - block
    b970 - block
    b394 - block
    b952 - block
    b584 - block
    b806 - block
    b215 - block
    b829 - block
    b998 - block
    b610 - block
    b896 - block
    b482 - block
    b312 - block
    b867 - block
    b11 - block
    b144 - block
    b244 - block
    b183 - block
    b491 - block
    b287 - block
    b198 - block
    b943 - block
    b440 - block
    b830 - block
    b359 - block
    b168 - block
    b980 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b857 b93 )
    ( on b399 b857 )
    ( on b83 b399 )
    ( on b411 b83 )
    ( on b115 b411 )
    ( on b718 b115 )
    ( on b271 b718 )
    ( on b181 b271 )
    ( on b91 b181 )
    ( on b965 b91 )
    ( on b336 b965 )
    ( on b670 b336 )
    ( on b164 b670 )
    ( on b991 b164 )
    ( on b468 b991 )
    ( on b662 b468 )
    ( on b154 b662 )
    ( on b496 b154 )
    ( on b457 b496 )
    ( on b818 b457 )
    ( on b970 b818 )
    ( on b394 b970 )
    ( on b952 b394 )
    ( on b584 b952 )
    ( on b806 b584 )
    ( on b215 b806 )
    ( on b829 b215 )
    ( on b998 b829 )
    ( on b610 b998 )
    ( on b896 b610 )
    ( on b482 b896 )
    ( on b312 b482 )
    ( on b867 b312 )
    ( on b11 b867 )
    ( on b144 b11 )
    ( on b244 b144 )
    ( on b183 b244 )
    ( on b491 b183 )
    ( on b287 b491 )
    ( on b198 b287 )
    ( on b943 b198 )
    ( on b440 b943 )
    ( on b830 b440 )
    ( on b359 b830 )
    ( on b168 b359 )
    ( on b980 b168 )
    ( clear b980 )
  )
  ( :goal
    ( and
      ( clear b93 )
    )
  )
)
