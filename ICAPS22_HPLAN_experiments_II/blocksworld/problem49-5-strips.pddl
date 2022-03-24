( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b263 - block
    b113 - block
    b134 - block
    b227 - block
    b83 - block
    b618 - block
    b595 - block
    b580 - block
    b161 - block
    b791 - block
    b171 - block
    b77 - block
    b519 - block
    b786 - block
    b308 - block
    b607 - block
    b873 - block
    b345 - block
    b27 - block
    b680 - block
    b585 - block
    b404 - block
    b670 - block
    b211 - block
    b353 - block
    b315 - block
    b967 - block
    b590 - block
    b193 - block
    b364 - block
    b191 - block
    b604 - block
    b37 - block
    b594 - block
    b29 - block
    b748 - block
    b781 - block
    b971 - block
    b417 - block
    b646 - block
    b530 - block
    b144 - block
    b769 - block
    b810 - block
    b355 - block
    b826 - block
    b729 - block
    b737 - block
    b65 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b263 )
    ( on b113 b263 )
    ( on b134 b113 )
    ( on b227 b134 )
    ( on b83 b227 )
    ( on b618 b83 )
    ( on b595 b618 )
    ( on b580 b595 )
    ( on b161 b580 )
    ( on b791 b161 )
    ( on b171 b791 )
    ( on b77 b171 )
    ( on b519 b77 )
    ( on b786 b519 )
    ( on b308 b786 )
    ( on b607 b308 )
    ( on b873 b607 )
    ( on b345 b873 )
    ( on b27 b345 )
    ( on b680 b27 )
    ( on b585 b680 )
    ( on b404 b585 )
    ( on b670 b404 )
    ( on b211 b670 )
    ( on b353 b211 )
    ( on b315 b353 )
    ( on b967 b315 )
    ( on b590 b967 )
    ( on b193 b590 )
    ( on b364 b193 )
    ( on b191 b364 )
    ( on b604 b191 )
    ( on b37 b604 )
    ( on b594 b37 )
    ( on b29 b594 )
    ( on b748 b29 )
    ( on b781 b748 )
    ( on b971 b781 )
    ( on b417 b971 )
    ( on b646 b417 )
    ( on b530 b646 )
    ( on b144 b530 )
    ( on b769 b144 )
    ( on b810 b769 )
    ( on b355 b810 )
    ( on b826 b355 )
    ( on b729 b826 )
    ( on b737 b729 )
    ( on b65 b737 )
    ( on b885 b65 )
    ( clear b885 )
  )
  ( :goal
    ( and
      ( clear b263 )
    )
  )
)
