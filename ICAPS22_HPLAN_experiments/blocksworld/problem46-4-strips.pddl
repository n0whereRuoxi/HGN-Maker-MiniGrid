( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b745 - block
    b159 - block
    b581 - block
    b320 - block
    b140 - block
    b30 - block
    b144 - block
    b151 - block
    b101 - block
    b46 - block
    b513 - block
    b399 - block
    b207 - block
    b816 - block
    b896 - block
    b256 - block
    b707 - block
    b407 - block
    b704 - block
    b954 - block
    b54 - block
    b203 - block
    b426 - block
    b241 - block
    b360 - block
    b190 - block
    b278 - block
    b26 - block
    b139 - block
    b959 - block
    b981 - block
    b179 - block
    b864 - block
    b530 - block
    b250 - block
    b89 - block
    b434 - block
    b839 - block
    b259 - block
    b346 - block
    b732 - block
    b492 - block
    b142 - block
    b394 - block
    b550 - block
    b348 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b745 )
    ( on b159 b745 )
    ( on b581 b159 )
    ( on b320 b581 )
    ( on b140 b320 )
    ( on b30 b140 )
    ( on b144 b30 )
    ( on b151 b144 )
    ( on b101 b151 )
    ( on b46 b101 )
    ( on b513 b46 )
    ( on b399 b513 )
    ( on b207 b399 )
    ( on b816 b207 )
    ( on b896 b816 )
    ( on b256 b896 )
    ( on b707 b256 )
    ( on b407 b707 )
    ( on b704 b407 )
    ( on b954 b704 )
    ( on b54 b954 )
    ( on b203 b54 )
    ( on b426 b203 )
    ( on b241 b426 )
    ( on b360 b241 )
    ( on b190 b360 )
    ( on b278 b190 )
    ( on b26 b278 )
    ( on b139 b26 )
    ( on b959 b139 )
    ( on b981 b959 )
    ( on b179 b981 )
    ( on b864 b179 )
    ( on b530 b864 )
    ( on b250 b530 )
    ( on b89 b250 )
    ( on b434 b89 )
    ( on b839 b434 )
    ( on b259 b839 )
    ( on b346 b259 )
    ( on b732 b346 )
    ( on b492 b732 )
    ( on b142 b492 )
    ( on b394 b142 )
    ( on b550 b394 )
    ( on b348 b550 )
    ( on b721 b348 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b745 )
    )
  )
)
