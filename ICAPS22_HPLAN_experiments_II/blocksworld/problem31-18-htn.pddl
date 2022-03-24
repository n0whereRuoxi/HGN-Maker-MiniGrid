( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b935 - block
    b884 - block
    b300 - block
    b517 - block
    b183 - block
    b959 - block
    b387 - block
    b215 - block
    b748 - block
    b537 - block
    b662 - block
    b450 - block
    b887 - block
    b63 - block
    b710 - block
    b840 - block
    b676 - block
    b922 - block
    b980 - block
    b176 - block
    b575 - block
    b405 - block
    b128 - block
    b977 - block
    b936 - block
    b798 - block
    b278 - block
    b813 - block
    b722 - block
    b107 - block
    b445 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b935 b918 )
    ( on b884 b935 )
    ( on b300 b884 )
    ( on b517 b300 )
    ( on b183 b517 )
    ( on b959 b183 )
    ( on b387 b959 )
    ( on b215 b387 )
    ( on b748 b215 )
    ( on b537 b748 )
    ( on b662 b537 )
    ( on b450 b662 )
    ( on b887 b450 )
    ( on b63 b887 )
    ( on b710 b63 )
    ( on b840 b710 )
    ( on b676 b840 )
    ( on b922 b676 )
    ( on b980 b922 )
    ( on b176 b980 )
    ( on b575 b176 )
    ( on b405 b575 )
    ( on b128 b405 )
    ( on b977 b128 )
    ( on b936 b977 )
    ( on b798 b936 )
    ( on b278 b798 )
    ( on b813 b278 )
    ( on b722 b813 )
    ( on b107 b722 )
    ( on b445 b107 )
    ( clear b445 )
  )
  ( :tasks
    ( Make-31Pile b935 b884 b300 b517 b183 b959 b387 b215 b748 b537 b662 b450 b887 b63 b710 b840 b676 b922 b980 b176 b575 b405 b128 b977 b936 b798 b278 b813 b722 b107 b445 )
  )
)
