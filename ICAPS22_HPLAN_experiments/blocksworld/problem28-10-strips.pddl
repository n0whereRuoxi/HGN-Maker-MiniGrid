( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b721 - block
    b519 - block
    b955 - block
    b757 - block
    b251 - block
    b378 - block
    b957 - block
    b982 - block
    b361 - block
    b537 - block
    b286 - block
    b118 - block
    b268 - block
    b915 - block
    b166 - block
    b370 - block
    b431 - block
    b392 - block
    b802 - block
    b319 - block
    b811 - block
    b40 - block
    b780 - block
    b852 - block
    b259 - block
    b127 - block
    b48 - block
    b158 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b721 b871 )
    ( on b519 b721 )
    ( on b955 b519 )
    ( on b757 b955 )
    ( on b251 b757 )
    ( on b378 b251 )
    ( on b957 b378 )
    ( on b982 b957 )
    ( on b361 b982 )
    ( on b537 b361 )
    ( on b286 b537 )
    ( on b118 b286 )
    ( on b268 b118 )
    ( on b915 b268 )
    ( on b166 b915 )
    ( on b370 b166 )
    ( on b431 b370 )
    ( on b392 b431 )
    ( on b802 b392 )
    ( on b319 b802 )
    ( on b811 b319 )
    ( on b40 b811 )
    ( on b780 b40 )
    ( on b852 b780 )
    ( on b259 b852 )
    ( on b127 b259 )
    ( on b48 b127 )
    ( on b158 b48 )
    ( clear b158 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
