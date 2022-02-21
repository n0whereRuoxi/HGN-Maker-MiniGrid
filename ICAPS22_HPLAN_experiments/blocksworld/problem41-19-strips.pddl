( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b105 - block
    b808 - block
    b977 - block
    b939 - block
    b956 - block
    b694 - block
    b884 - block
    b427 - block
    b626 - block
    b737 - block
    b207 - block
    b864 - block
    b449 - block
    b64 - block
    b144 - block
    b664 - block
    b743 - block
    b544 - block
    b513 - block
    b140 - block
    b582 - block
    b423 - block
    b98 - block
    b509 - block
    b726 - block
    b307 - block
    b996 - block
    b610 - block
    b629 - block
    b77 - block
    b686 - block
    b184 - block
    b945 - block
    b576 - block
    b899 - block
    b657 - block
    b421 - block
    b101 - block
    b361 - block
    b798 - block
    b129 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b105 b902 )
    ( on b808 b105 )
    ( on b977 b808 )
    ( on b939 b977 )
    ( on b956 b939 )
    ( on b694 b956 )
    ( on b884 b694 )
    ( on b427 b884 )
    ( on b626 b427 )
    ( on b737 b626 )
    ( on b207 b737 )
    ( on b864 b207 )
    ( on b449 b864 )
    ( on b64 b449 )
    ( on b144 b64 )
    ( on b664 b144 )
    ( on b743 b664 )
    ( on b544 b743 )
    ( on b513 b544 )
    ( on b140 b513 )
    ( on b582 b140 )
    ( on b423 b582 )
    ( on b98 b423 )
    ( on b509 b98 )
    ( on b726 b509 )
    ( on b307 b726 )
    ( on b996 b307 )
    ( on b610 b996 )
    ( on b629 b610 )
    ( on b77 b629 )
    ( on b686 b77 )
    ( on b184 b686 )
    ( on b945 b184 )
    ( on b576 b945 )
    ( on b899 b576 )
    ( on b657 b899 )
    ( on b421 b657 )
    ( on b101 b421 )
    ( on b361 b101 )
    ( on b798 b361 )
    ( on b129 b798 )
    ( clear b129 )
  )
  ( :goal
    ( and
      ( clear b902 )
    )
  )
)
