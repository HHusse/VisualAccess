﻿using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using log4net;
using Microsoft.IdentityModel.Tokens;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces;
using VisualAccess.Domain.Interfaces.Factories;

namespace VisualAccess.Business.Factories
{
    public class TokenFactory : ITokenFactory
    {
        public string Create(Account account)
        {
            List<Claim> claims = new List<Claim> {
                new Claim(ClaimTypes.Actor, "ACCOUNT"),
                new Claim(ClaimTypes.NameIdentifier, account.Username),
                new Claim(ClaimTypes.Role, account.Role.ToString())
            };

            string secretKey = Environment.GetEnvironmentVariable("VSAC_SECRETKEY")!;
            string issuer = Environment.GetEnvironmentVariable("VSAC_ISSUER")!;

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

            var token = new JwtSecurityToken(
                    issuer: issuer,
                    claims: claims,
                    expires: DateTime.Now.AddDays(1),
                    signingCredentials: creds
                );
            var jwtToken = new JwtSecurityTokenHandler().WriteToken(token);

            return jwtToken;
        }

        public string Create(Room room)
        {
            List<Claim> claims = new List<Claim> {
                new Claim(ClaimTypes.Actor, "ROOM"),
                new Claim(ClaimTypes.NameIdentifier, room.Name),
            };

            string secretKey = Environment.GetEnvironmentVariable("VSAC_SECRETKEY")!;
            string issuer = Environment.GetEnvironmentVariable("VSAC_ISSUER")!;

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

            var token = new JwtSecurityToken(
                    issuer: issuer,
                    claims: claims,
                    expires: DateTime.Now.AddDays(1),
                    signingCredentials: creds
                );
            var jwtToken = new JwtSecurityTokenHandler().WriteToken(token);

            return jwtToken;
        }
    }
}

